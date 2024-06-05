<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $dni = $_POST['dni'];
    $password = $_POST['password'];
    $tipo = $_POST['tipo']; // 'entrada' o 'salida'

    $mysqli = new mysqli("localhost", "root", "", "control_personal");

    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    $stmt = $mysqli->prepare("SELECT password FROM usuarios WHERE dni = ?");
    $stmt->bind_param("s", $dni);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($hash);

    if ($stmt->num_rows > 0) {
        $stmt->fetch();
        if (password_verify($password, $hash)) {
            $stmt->close();

            $stmt = $mysqli->prepare("INSERT INTO registros (dni, tipo) VALUES (?, ?)");
            $stmt->bind_param("ss", $dni, $tipo);
            $stmt->execute();
            $stmt->close();

            $mensaje = "Has Fichado Correctamente";
            $tipo_mensaje = "success";
        } else {
            $mensaje = "Debes Introducir los Datos Correctos";
            $tipo_mensaje = "warning";
        }
    } else {
        $mensaje = "Debes Introducir los Datos Correctos";
        $tipo_mensaje = "warning";
    }

    //$stmt->close();
    $mysqli->close();
}

$registros_entrada = [];
$registros_salida = [];
$mysqli = new mysqli("localhost", "root", "", "control_personal");
$result = $mysqli->query("SELECT dni, tipo, fecha_hora FROM registros ORDER BY fecha_hora DESC");

while ($row = $result->fetch_assoc()) {
    if ($row['tipo'] == 'entrada') {
        $registros_entrada[] = $row;
    } else {
        $registros_salida[] = $row;
    }
}

$result->close();
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Control de Entradas y Salidas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Control de Entradas y Salidas</h2>
        <?php if (isset($mensaje)): ?>
            <div class="alert alert-<?= $tipo_mensaje ?>" role="alert">
                <?= $mensaje ?>
            </div>
        <?php endif; ?>
        <form method="post" action="index.php">
            <div class="form-group">
                <label for="dni">DNI</label>
                <input type="text" class="form-control" id="dni" name="dni" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="tipo">Tipo</label>
                <select class="form-control" id="tipo" name="tipo" required>
                    <option value="entrada">Entrada</option>
                    <option value="salida">Salida</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Fichar</button>
        </form>

        <h3 class="mt-5">Registros de Entradas</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">DNI</th>
                    <th scope="col">Fecha y Hora</th>
                    <th scope="col">Tipo</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($registros_entrada as $registro): ?>
                    <tr>
                        <td><?= htmlspecialchars($registro['dni']) ?></td>
                        <td><?= htmlspecialchars($registro['fecha_hora']) ?></td>
                        <td><?= htmlspecialchars($registro['tipo']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <h3 class="mt-5">Registros de Salidas</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">DNI</th>
                    <th scope="col">Fecha y Hora</th>
                    <th scope="col">Tipo</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($registros_salida as $registro): ?>
                    <tr>
                        <td><?= htmlspecialchars($registro['dni']) ?></td>
                        <td><?= htmlspecialchars($registro['fecha_hora']) ?></td>
                        <td><?= htmlspecialchars($registro['tipo']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
