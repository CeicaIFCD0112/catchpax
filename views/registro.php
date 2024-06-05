<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $dni = $_POST['dni'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $mysqli = new mysqli("localhost", "root", "", "control_personal");

    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    $stmt = $mysqli->prepare("INSERT INTO usuarios (nombre, apellidos, dni, password) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $nombre, $apellidos, $dni, $password);

    if ($stmt->execute()) {
        echo "Registro exitoso.";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $mysqli->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Personal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Registro de Personal</h2>
        <form method="post" action="registro.php">
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="apellidos">Apellidos</label>
                <input type="text" class="form-control" id="apellidos" name="apellidos" required>
            </div>
            <div class="form-group">
                <label for="dni">DNI</label>
                <input type="text" class="form-control" id="dni" name="dni" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Registrar</button>
        </form>
        <a href="index.php" class="btn btn-secondary mt-3">Ir al Control de Entradas y Salidas</a>
    </div>
</body>
</html>
