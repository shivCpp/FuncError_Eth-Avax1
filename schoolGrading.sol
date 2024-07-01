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
