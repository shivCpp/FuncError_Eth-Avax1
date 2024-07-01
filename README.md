# SchoolGrading Smart Contract

The `SchoolGrading` smart contract is designed to manage student grades in a decentralized manner using the Ethereum blockchain. This contract allows the submission, approval, and rejection of grades for students, ensuring that grades are handled securely and transparently.

## Overview

The `SchoolGrading` smart contract includes the following features:
- Submission of grades for students in specific subjects.
- Approval and rejection of submitted grades.
- Events emitted upon approval or rejection of grades.

## Understanding the Contract

### State Variables

-  gradeCount tracks the number of grades submitted,
-  studentAddresses maps grade IDs to student addresses,
-  subjects associates grade IDs with subjects,
-  grades stores the actual grades,
-  isApproved and isRejected track the approval and rejection status of grades.

### Events

- `event GradeApproved(uint gradeId, address student)`: Emitted when a grade is approved.
- `event GradeRejected(uint gradeId, address student)`: Emitted when a grade is rejected.

### Functions

1. `submitGrade(address student, string memory subject, uint grade) public returns(uint)`
   It allows submitting a grade for a student in a specific subject, ensuring the grade is between 0 and 100, and returns a new grade ID; 

2. `approveGrade(uint gradeId) public`
   It approves a grade by its ID, ensuring the grade exists and hasn't been approved yet, and emits the GradeApproved event; 

3. `rejectGrade(uint gradeId) public`
   It rejects a grade by its ID, ensuring the grade exists and hasn't been rejected yet, and emits the GradeRejected event.
  
     
## Usage
to uses this contract or exectue you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., studentGrading.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGrading {
    uint public gradeCount;
    mapping(uint => address) public studentAddresses;
    mapping(uint => string) public subjects;
    mapping(uint => uint) public grades;
    mapping(uint => bool) public isApproved;
    mapping(uint => bool) public isRejected;
    
    event GradeApproved(uint gradeId, address student);
    event GradeRejected(uint gradeId, address student);
    
    // REQUIRE FUNCTION()
    function submitGrade(address student, string memory subject, uint grade) public returns(uint) {
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100");
        gradeCount++;
        studentAddresses[gradeCount] = student;
        subjects[gradeCount] = subject;
        grades[gradeCount] = grade;
        return gradeCount;
    }
    
    // ASSERT FUNCTION()
    function approveGrade(uint gradeId) public {
        assert(studentAddresses[gradeId] != address(0) && !isApproved[gradeId]);
        
        isApproved[gradeId] = true;
        emit GradeApproved(gradeId, studentAddresses[gradeId]);
    }

    // REVERT FUNCTION()
    function rejectGrade(uint gradeId) public {
        if (studentAddresses[gradeId] == address(0) || isRejected[gradeId]) {
            revert("Grade does not exist or has already been rejected");
        }

        isRejected[gradeId] = true;
        emit GradeRejected(gradeId, studentAddresses[gradeId]);
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile studentGrading.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy " tab in the left-hand sidebar. Select the "studentGrading" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can use the deployed contract interface to call the submitGrade, approveGrade and rejectGrade .You can enter addresses and values to test the functionality. After entering data, click on "transact" button to execute the function , enter the grade and do testing. 

## Contact
For any questions or suggestions, feel free to open an issue or contact the repository owner.

Mail - vermashiv1910@gmail.com
