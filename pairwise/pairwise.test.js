const pairwise = require("./pairwise");

describe("Tests for Pairwise function", () => {
  it("should return 11", () => {
    expect(pairwise([1, 4, 2, 3, 0, 5], 7)).toBe(11);
  });
  it("should return 1", () => {
    expect(pairwise([1, 1, 1], 2)).toBe(1);
  });
  it("should return 1", () => {
    expect(pairwise([1, 3, 2, 4], 4)).toBe(1);
  });
  it("should return 10", () => {
    expect(pairwise([0, 0, 0, 0, 1, 1], 1)).toBe(10);
  });
  it("should return 0", () => {
    expect(pairwise([], 100)).toBe(0);
  });
});
