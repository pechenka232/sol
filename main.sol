// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//обычный контракт
contract StorageExample {
    uint256 public storedValue;

    constructor(uint256 _initialValue) {
        storedValue = _initialValue;
    }

    function updateStoredValue(uint256 _newValue) public {
        uint256 tempValue = storedValue * 2;  
        storedValue = calculateValue(tempValue, _newValue);  
    }

    function calculateValue(uint256 _tempValue, uint256 _inputValue) public pure returns (uint256) {
        uint256 result = _tempValue + _inputValue; 
        return result;
    }

    function processArray(uint256[] calldata _inputArray) external pure returns (uint256[] memory) {
        uint256[] memory outputArray = new uint256[](_inputArray.length);  
        for (uint256 i = 0; i < _inputArray.length; i++) {
            outputArray[i] = _inputArray[i] * 2;
        }
        return outputArray;
    }

    function getStoredValue() public view returns (uint256) {
        return storedValue;  // Использование storage
    }
}
//Оптимизированный контракт  
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageOptimized {
    uint256 public storedValue;

    constructor(uint256 _initialValue) {
        storedValue = _initialValue;
    }

    function updateStoredValue(uint256 _newValue) public {
        storedValue = (storedValue * 2) + _newValue;  
    }

    function processArray(uint256[] calldata _inputArray) external pure returns (uint256[] memory) {
        uint256[] memory outputArray = new uint256[](_inputArray.length);
        for (uint256 i = 0; i < _inputArray.length; i++) {
            outputArray[i] = _inputArray[i] * 2;  
        }
        return outputArray;
    }

    function getStoredValue() public view returns (uint256) {
        return storedValue;
    }
}
