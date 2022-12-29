/*
Link:
https://www.freecodecamp.org/learn/coding-interview-prep/algorithms/find-the-symmetric-difference

The mathematical term symmetric difference (△ or ⊕) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets A = {1, 2, 3} and B = {2, 3, 4}, A △ B = {1, 4}.
Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among three elements (A △ B △ C), you must complete one operation at a time. Thus, for sets A and B above, and C = {2, 3}, A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}.
Create a function that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (no duplicates).
*/

// 2nd version of code
/*
\\\\Pseudocode////
We don't know how many arguments will be given so spread the arguments coming into the  sym function
declare an initialise a result variable with the first element of the spread args
loop over the elements in the args array calling a helper function arrChecker() on arr in current index and next index
    HELPER FUNCTION:
    declare an empty array for the functions result
    the helper fucntion takes two arguments and turns both into sets, to remove internal duplicates
    then spreading those into one larger array we loop over the elems of all the values addings the elems to a Map where the key= value(i.e. the number given), and the Map value = the count for that key's appearance.
      finally loop over the Map's data and for all keys where the value === 1 push the key to result.
    return result
return the result of the sym function sorted in ascending order.
*/
function arrChecker(arr1, arr2) {
  const result = [];
  const vals1 = new Set(arr1);
  const vals2 = new Set(arr2);
  const allVals = [...vals1, ...vals2];

  const valCounts = new Map();
  allVals.forEach(elem => {
    if (valCounts.has(elem)) {
      const value = valCounts.get(elem);
      console.log(value);
      valCounts.set(elem, value + 1);
    } else {
      valCounts.set(elem, 1);
    }
  });
  valCounts.forEach((val, key) => {
    if (val === 1) {
      result.push(key);
    }
  });
  return result;
}

function sym(...args) {
  let result = args[0];
  for (let i = 1; i < args.length; i++) {
    result = arrChecker(result, args[i]);
  }
  return result.sort((a, b) => a - b);
}
console.log(arrChecker([1, 2, 3], [5, 2, 1, 4]));
