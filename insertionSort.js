/*
\\\\pseudocode////
Declare a variable inside the function to take a new array: sortedArr, initialise with the value of the given array[0];
loop through the given array starting from [1] index
push current index of array to sortedArr
  if sortedArr[i] is greater than sortedArr at previous index continue
  else 
    while sortedArr[currIndex] is greater than sortedArr[prevIndex]
      swap sortedArr[currIndex] with sortedArr[prevIndex], passing the value back down the sorted array until it's in the correct place.
      decrement currIndex and prevIndex with each iteration of the while loop to walk through the array
return the sortedArr
*/

function insertionSort(array) {
  const sortedArr = [array[0]];
  for (let i = 1; i < array.length; i++) {
    let prevIndex = i - 1;
    let currIndex = i;
    sortedArr.push(array[i]);
    if (sortedArr[currIndex] < sortedArr[prevIndex]) {
      while (sortedArr[currIndex] < sortedArr[prevIndex]) {
        let temp = sortedArr[currIndex];
        sortedArr[currIndex] = sortedArr[prevIndex];
        sortedArr[prevIndex] = temp;
        prevIndex--;
        currIndex--;
      }
    }
  }
  return sortedArr;
}

console.log(
  insertionSort([
    1, 4, 2, 8, 345, 123, 43, 32, 5643, 63, 123, 43, 2, 55, 1, 234, 92,
  ])
);
