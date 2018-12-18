export const Matrix = (input) => {
  const rows = input.split('\n').map(row => row.split(' ').map(Number));

  return {
    rows: rows,
    columns: rows[0].map((col,i) => rows.map(row => row[i]))
  }
};
