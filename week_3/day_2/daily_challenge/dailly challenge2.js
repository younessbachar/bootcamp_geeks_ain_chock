let n = 5;
let output = "";
let starsInRow = 1;
let count = 0;

// First way: using one loop
for (let i = 1; i <= (n * (n + 1)) / 2; i++) {
  output += "* ";
  count++;

  if (count === starsInRow) {
    output += "\n";
    starsInRow++;
    count = 0;
  }
}

console.log(output);

// Second way: using nested loops
for (let i = 0; i < n; i++) {
  let row = "";
  for (let j = 0; j <= i; j++) {
    row += "* ";
  }
  console.log(row);
}
