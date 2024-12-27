<?php
include 'config.php';

// Aktifkan error reporting untuk debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Header untuk menangani CORS dan format response
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Tangani preflight request dari browser
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

$method = $_SERVER['REQUEST_METHOD'];

// Fungsi untuk menangani error respons
function sendError($message, $statusCode = 400)
{
    http_response_code($statusCode);
    echo json_encode(["error" => $message]);
    exit;
}

// Fungsi validasi JSON input
function getJSONInput()
{
    $input = json_decode(file_get_contents('php://input'), true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        sendError("Invalid JSON input");
    }
    return $input;
}

switch ($method) {
    // ======= GET: Ambil semua data =======
    case 'GET':
        $sql = "SELECT * FROM items";
        $result = $conn->query($sql);

        if ($result) {
            $items = [];
            while ($row = $result->fetch_assoc()) {
                $items[] = $row;
            }
            echo json_encode($items);
        } else {
            sendError("Error fetching data: " . $conn->error);
        }
        break;

    // ======= POST: Tambah data baru =======
    case 'POST':
        $data = getJSONInput();

        // Validasi input data
        $nama = $data['nama'] ?? null;
        $deskripsi = $data['deskripsi'] ?? null;
        $harga = $data['harga'] ?? null;

        if (!$nama || !$deskripsi || !$harga) {
            sendError("Semua field (nama, deskripsi, harga) harus diisi");
        }

        // Gunakan prepared statement
        $stmt = $conn->prepare("INSERT INTO items (nama, deskripsi, harga) VALUES (?, ?, ?)");
        $stmt->bind_param("ssd", $nama, $deskripsi, $harga);

        if ($stmt->execute()) {
            echo json_encode(["message" => "Item created"]);
        } else {
            sendError("Failed to create item: " . $stmt->error);
        }
        $stmt->close();
        break;

    // ======= PUT: Update data =======
    case 'PUT':
        $data = getJSONInput();

        // Validasi input data
        $id = $data['id'] ?? null;
        $nama = $data['nama'] ?? null;
        $deskripsi = $data['deskripsi'] ?? null;
        $harga = $data['harga'] ?? null;

        if (!$id || !$nama || !$deskripsi || !$harga) {
            sendError("Semua field (id, nama, deskripsi, harga) harus diisi");
        }

        // Gunakan prepared statement
        $stmt = $conn->prepare("UPDATE items SET nama = ?, deskripsi = ?, harga = ? WHERE id = ?");
        $stmt->bind_param("ssdi", $nama, $deskripsi, $harga, $id);

        if ($stmt->execute()) {
            echo json_encode(["message" => "Item updated"]);
        } else {
            sendError("Failed to update item: " . $stmt->error);
        }
        $stmt->close();
        break;

    // ======= DELETE: Hapus data =======
    case 'DELETE':
        $data = getJSONInput();

        // Validasi input ID
        $id = $data['id'] ?? null;
        if (!$id) {
            sendError("ID harus diisi untuk menghapus data");
        }

        // Gunakan prepared statement
        $stmt = $conn->prepare("DELETE FROM items WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo json_encode(["message" => "Item deleted"]);
        } else {
            sendError("Failed to delete item: " . $stmt->error);
        }
        $stmt->close();
        break;

    // ======= Default: Method tidak diizinkan =======
    default:
        sendError("Method not allowed", 405);
        break;
}