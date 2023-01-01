/*
Link:
https://www.freecodecamp.org/learn/coding-interview-prep/algorithms/implement-quick-sort
Here we will move on to an intermediate sorting algorithm: quick sort. Quick sort is an efficient, recursive divide-and-conquer approach to sorting an array. In this method, a pivot value is chosen in the original array. The array is then partitioned into two subarrays of values less than and greater than the pivot value. We then combine the result of recursively calling the quick sort algorithm on both sub-arrays. This continues until the base case of an empty or single-item array is reached, which we return. The unwinding of the recursive calls return us the sorted array.

Quick sort is a very efficient sorting method, providing O(nlog(n)) performance on average. It is also relatively easy to implement. These attributes make it a popular and useful sorting method.

Instructions: Write a function quickSort which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest. While the choice of the pivot value is important, any pivot will do for our purposes here. For simplicity, the first or last element could be used.

\\\\pseudocode////
if the array received has one element, return it, as it is by definition naturally sorted.
take a pivot point in the array, the last element (can be any but the last is an easy anchor)
create two arrays: "left" and "right"
  loop through values up to and exclusive of the pivot value
  if value < pivot push to leftArr
  if value > pivot push to rightArr
if both left and right have lengths of 1 or more, return the spread results of both from a quickSort as well as the pivot value (effectively passing a new array, which gets more sorted with each recursion)
else if left has of 1 or more but right doesn't return spread the result of quickSort(left), pivot as a new array
else do the same but with the pivot value and the right array passed to the quickSort function.
*/
// function completed creating additional arrays. This is not an inplace sort method and thus can be optimised further. Will do so when completing it in Leetcode.
function quickSort(arr) {
  if (arr.length < 2) return arr;
  let pivot = arr[arr.length - 1];
  let left = [];
  let right = [];
  for (const elem of arr.slice(0, arr.length - 1)) {
    if (elem < pivot) {
      left.push(elem);
    } else {
      right.push(elem);
    }
  }
  if (left.length >= 1 && right.length >= 1) {
    return [...quickSort(left), pivot, ...quickSort(right)];
  } else if (left.length >= 1) {
    return [...quickSort(left), pivot];
  } else {
    return [pivot, ...quickSort(right)];
  }
}

console.log(quickSort([5, 2, 3, 1]));
console.log(quickSort([5, 1, 1, 2, 0, 0]));
console.log(
  quickSort([
    1, 4, 2, 8, 345, 123, 43, 32, 5643, 63, 123, 43, 2, 55, 1, 234, 92,
  ])
);
