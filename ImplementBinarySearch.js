/*
Link:
https://www.freecodecamp.org/learn/coding-interview-prep/algorithms/implement-binary-search

Binary search is an O(log(n)) efficiency algorithm for searching a sorted array to find an element. It operates using the following steps:
\\\\\\//////
  Find the middle value of a sorted array. If value == target return (found it!).
  If middle value < target, search right half of array in next compare.
  If middle value > target, search left half of array in next compare.
//////\\\\\\
  As you can see, you are successively halving an array, which gives you the log(n) efficiency. For this challenge, we want you to show your work - how you got to the target value... the path you took!
Write a function binarySearch that implements the binary search algorithm on an array, returning the path you took (each middle value comparison) to find the target in an array.

The function takes a sorted array of integers and a target value as input. It returns an array containing (in-order) the middle value you found at each halving of the original array until you found the target value. The target value should be the last element of the returned array. If value not is found, return the string Value Not Found.

For example, binarySearch([1,2,3,4,5,6,7], 5) would return [4,6,5].

For this challenge, when halving, you MUST use Math.floor() when doing division: Math.floor(x/2). This will give a consistent, testable path.

\\\\Pseudocode////
decalre vars for start, mid and end to = indexes of the array
while the start is less than or equal to the end
  push the current mid index of searchList to arrayPath;
  if the value === the current mid point 
    return the array path
  else if value is less than the current mid point
    we reset the end of the array to be the current midpoint -1
    
  else if value is greater than current mid point
    we reset the start to be the current mid point +1
  then irrespective of either else statements reset the mid point to be the sum of the (start+end)/2
when the while loop finishes if no value is found, then s doesn't exist in that array
return "Value not found";
*/

function binarySearch(searchList, value) {
  const arrayPath = [];
  let start = 0;
  let end = searchList.length - 1;
  let mid = Math.floor(end / 2);
  while (start <= end) {
    arrayPath.push(searchList[mid]);
    if (value === searchList[mid]) {
      return arrayPath;
    } else if (value < searchList[mid]) {
      end = mid - 1;
    } else if (value > searchList[mid]) {
      start = mid + 1;
    }
    mid = Math.floor((start + end) / 2);
  }
  return "Value Not Found";
}

console.log(binarySearch([1, 2, 3, 4, 5, 6, 7], 5));
console.log(
  binarySearch(
    [
      0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
      22, 23, 49, 70,
    ],
    0
  )
);
console.log(
  binarySearch(
    [
      0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
      22, 23, 49, 70,
    ],
    21
  )
);
