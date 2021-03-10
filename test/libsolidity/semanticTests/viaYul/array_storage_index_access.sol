contract C {
    uint[] storageArray;
    function test_indices(uint256 len) public
    {
        while (storageArray.length < len)
            storageArray.push();
        while (storageArray.length > len)
            storageArray.pop();
        for (uint i = 0; i < len; i++)
            storageArray[i] = i + 1;

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == i + 1);
    }
}
// ====
// compileViaYul: also
// ----
// test_indices(uint256): 1 ->
// test_indices(uint256): 129 ->
// gas irOptimized: 3573187
// gas legacy: 3340105
// gas legacyOptimized: 3280773
// test_indices(uint256): 5 ->
// gas irOptimized: 684711
// gas legacy: 458941
// gas legacyOptimized: 455849
// test_indices(uint256): 10 ->
// test_indices(uint256): 15 ->
// gas irOptimized: 115405
// test_indices(uint256): 0xFF ->
// gas irOptimized: 4555765
// gas legacy: 4107867
// gas legacyOptimized: 3991807
// test_indices(uint256): 1000 ->
// gas irOptimized: 21922632
// gas legacy: 20360399
// gas legacyOptimized: 19921344
// test_indices(uint256): 129 ->
// gas irOptimized: 5135717
// gas legacy: 3472135
// gas legacyOptimized: 3415947
// test_indices(uint256): 128 ->
// gas irOptimized: 664170
// gas legacy: 556972
// gas legacyOptimized: 508124
// test_indices(uint256): 1 ->
// gas irOptimized: 680245
// gas legacy: 452407
// gas legacyOptimized: 450811
