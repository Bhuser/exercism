
export const solve = (x,y) => {
  if ([x, y].some(isNaN)) { return null }
  const MAX = Math.max(x,y);

  if (MAX <= 1)   { return 10; }
  if (MAX <= 5)   { return 5; }
  if (MAX <= 10)  { return 1; }

  return 0;
};
