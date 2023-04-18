<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generator Zapytań ✔</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<?php
$mysqli = new mysqli("localhost","root","","gz");

if ($mysqli -> connect_errno) {
  echo "Nie udało sie połączyć z bazą " . $mysqli -> connect_error;
  exit();
}

?>
<body>
    <section id="header">
    <div class="px-4 pt-5 text-center border-bottom">
        <h1 class="display-4 fw-bold">Generator Zadań MYSQL</h1>
        <div class="col-lg-6 mx-auto">
          <p class="lead mb-4">Zwykły prosty generator zadań do mysqla, wykonany za pomocą PHP, JS, biblioteki jsPDF oraz zwykłej bazy danych.</p>
          <form action="" method="post">
          <div class="form-floating mb-3">
            <input type="number" min="1" name="liczba" class="form-control" id="floatingInput">
            <label for="floatingInput">Wybierz liczbe zadań!</label>
          </div>
          <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
            <button type="submit" name="submit" class="btn btn-primary btn-lg px-4 me-sm-3">Generuj Zadania!</button>
            <button type="button" class="info btn btn-outline-secondary btn-lg px-4">Jak Generować Zadania?</button>
          </div>
        </div>
        </form>
        <div class="overflow-hidden" style="max-height: 30vh;">
          <div class="container px-5">
            <img src="jspdf.png" class="img-fluid border rounded-3 shadow-lg mb-4" alt="jsPDFimage" width="700" height="500" loading="lazy">
          </div>
        </div>
      </div>
    </section>
<?php

if(isset($_POST['submit'])) {
    $liczba = $_POST['liczba'];
    $sql = "SELECT id, tresc_zapytania, jaka_baza, link_bazy FROM `zadania` ORDER BY RAND() LIMIT $liczba";
    $result = $mysqli->query($sql);

    $ids = array();
    if ($result->num_rows > 0) {
        echo"
        <section id='PDF' class='text-center bg-light text-dark w-100'>
        <h1 class='display-4 fw-bold'>Wygenerowane Zapytania!</h1>
        ";
        $i = 1;
    while($row = $result->fetch_assoc()) {
        array_push($ids, $row['id']);
        echo"
        <div class='d-flex flex-column'>
            <p class='text-capitalize'><b>".$i. ". " .$row['tresc_zapytania']."</b></p>
            <p style='color: green;'>Zapytanie do bazy: ".$row['jaka_baza']."<a href='".$row['link_bazy']."' style='color: blue;'> ".$row['link_bazy']."</a></p>
        </div>";
        $i++;
    }
    echo"<p style='color: purple;'><b>Zapytania zostaly wygenerowane przez generator wykonany przez Autora: Konrada Daleckiego</b></p>";
    echo"<button type='button' class='newPDF btn btn-danger btn-lg px-2'>Wygeneruj PDF'a!</button>";
    echo"</section>";
    echo"<section class='text-center bg-light text-dark w-100'>
    <h1 class='display-4 fw-bold'>Wygenerowane Odpowiedzi!</h1>";
    $i = 1;
    foreach ($ids as $id) {
      $sql = "SELECT id_zadania, odpowiedz FROM `rozwiazania` WHERE id_zadania = $id";
      $result = $mysqli->query($sql);
      while($row = $result->fetch_assoc()) {
        echo "<div>";
        echo "<p style='color: green;'>Rozwiazanie ".$i.": <b>".$row['odpowiedz']. "</b></p>";
        echo "</div>";
        $i++;
    }
    }
    echo"</section>";
    } else {
    echo "Brak Wyników!";
    }
    $mysqli->close();
}

?>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>

    $(document).ready(function(){
        $('.info').click(function(){
            Swal.fire(
            'Jak wygenerować Zapytania?',
            'Wpisujemy liczbe oraz kilkamy przycisk Generuj Zadania, to takie proste!',
            'question'
            )
        })
        $('.newPDF').click(function(){
            let doc = new jsPDF({format: [2000, 1700]});
            let h1 = document.querySelector('#PDF')
            doc.setFont("helvetica");
            doc.setFontType("bold");
            doc.setFontSize(9);
            doc.fromHTML(h1,10,10)
            doc.save("zadania.pdf")
        })
    });
</script>
</html>