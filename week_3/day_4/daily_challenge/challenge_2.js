<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Letters Only Input</title>
</head>
<body>
  <h2>Enter letters only:</h2>
  <input type="text" id="lettersOnly" placeholder="Type here..." />

  <script>
    const input = document.getElementById("lettersOnly");

    input.addEventListener("input", () => {
      // Replace any character that is NOT a letter with an empty string
      input.value = input.value.replace(/[^a-zA-Z]/g, '');
    });
  </script>
</body>
</html>

