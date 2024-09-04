const { expect } = require("chai");

describe("StorageOptimized Contract", function () {
  let StorageOptimized;
  let storageOptimized;
  let owner;

  beforeEach(async function () {
    StorageOptimized = await ethers.getContractFactory("StorageOptimized");
    [owner] = await ethers.getSigners();
    storageOptimized = await StorageOptimized.deploy(100);
    await storageOptimized.deployed();
  });

  it("should initialize with the correct value", async function () {
    expect(await storageOptimized.getStoredValue()).to.equal(100);
  });

  it("should update the stored value correctly", async function () {
    await storageOptimized.updateStoredValue(50);
    expect(await storageOptimized.getStoredValue()).to.equal(250); 
  });

  it("should process array correctly", async function () {
    const inputArray = [1, 2, 3];
    const expectedOutputArray = [2, 4, 6];

    const result = await storageOptimized.processArray(inputArray);
    expect(result).to.deep.equal(expectedOutputArray);
  });

});
