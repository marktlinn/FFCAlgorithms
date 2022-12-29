/*
Link: https://www.freecodecamp.org/learn/coding-interview-prep/algorithms/implement-selection-sort

Implement Selection Sort

Here we will implement selection sort. Selection sort works by selecting the minimum value in a list and swapping it with the first value in the list. It then starts at the second position, selects the smallest value in the remaining list, and swaps it with the second element. It continues iterating through the list and swapping elements until it reaches the end of the list. Now the list is sorted. Selection sort has quadratic time complexity in all cases.

Instructions: Write a function selectionSort which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.
*/

/*
Loop through the array, testing if any of the succeeding elements are of a lesser value, if so, swap the elements.
Create a loop to iterate through the array
inside the loop initialise a variable minValIndex = current iteration index [i]
  within that loop create another to go through the array from that index onwards
    if element value at second index [j] is less than array[minValIndex]
      minValIndex = [j]
  when the second loop finishes
    if the minValIndex is greater than i, it's initial value
      create a temp var to store the array[minValIndex] value
      swap => array[minValIndex] = array[i]
      swap => array[i] = temp
return mutated array;
*/

function selectionSort(array) {
  for (let i = 0; i < array.length; i++) {
    let minValIndex = i;
    for (let j = i + 1; j < array.length; j++) {
      if (array[j] < array[minValIndex]) {
        minValIndex = j;
      }
    }
    if (minValIndex > i) {
      let temp = array[minValIndex];
      array[minValIndex] = array[i];
      array[i] = temp;
    }
  }
  return array;
}

console.log(
  selectionSort([
    1, 4, 2, 8, 345, 123, 43, 32, 5643, 63, 123, 43, 2, 55, 1, 234, 92,
  ])
);
console.log(selectionSort([1, 1, 4, 345, 2]));
