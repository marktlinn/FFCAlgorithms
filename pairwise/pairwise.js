/*
Link:
https://www.freecodecamp.org/learn/coding-interview-prep/algorithms/pairwise
Given an array arr, find element pairs whose sum equal the second argument arg and return the sum of their indices.

You may use multiple pairs that have the same numeric elements but different indices. Each pair should use the lowest possible available indices. Once an element has been used it cannot be reused to pair with another element. For instance, pairwise([1, 1, 2], 3) creates a pair [2, 1] using the 1 at index 0 rather than the 1 at index 1, because 0+2 < 1+2.

For example pairwise([7, 9, 11, 13, 15], 20) returns 6. The pairs that sum to 20 are [7, 13] and [9, 11]. We can then write out the array with their indices and values.

Index	0	1	2	3	4
Value	7	9	11	13	15
Below we'll take their corresponding indices and add them.

7 + 13 = 20 → Indices 0 + 3 = 3
9 + 11 = 20 → Indices 1 + 2 = 3
3 + 3 = 6 → Return 6


*/

/*
Pseudocode:
Create a map to store any found numbers as key-value pairs
declare a var to hold the results of the sums of indeces, init at 0
declare another var "usedIndex" to hold the last found index, init at 0


Loop through the array
  if element is equal to arr search the map for element that === 0
    search the array from usedIndex to end of arr
      set usedIndex to index of zero val + 1;
      add to result the sum of the index of the zero value + i;
  else if map has the key
    retrieve the value, delete the key from the map and add the value ot the result
  else add the current value to the map as a key with the value pair being the index
return the result
*/

function pairwise(arr, arg) {
  const map = new Map();
  let result = 0;
  let usedIndex = 0;

  for (let i = 0; i < arr.length; i++) {
    const sum = arg - arr[i];
    if (sum === 0) {
      if (map.has(0)) {
        const findZero = arr.slice(usedIndex).indexOf(0) + usedIndex;
        usedIndex = findZero + 1;
        result += findZero + i;
      }
    } else if (map.has(sum)) {
      const itemIndex = map.get(sum);
      map.delete(sum);
      result += itemIndex + i;
    } else {
      map.set(arr[i], i);
    }
  }

  return result;
}

console.log(pairwise([1, 4, 2, 3, 0, 5], 7)); // 11
console.log(pairwise([1, 1, 1], 2)); // 1
console.log(pairwise([0, 0, 0, 0, 1, 1], 1)); // 10

module.exports = pairwise;
