contract VulnerableContract {
    function execute(address _to, uint256 _value) public returns(uint) {
        if (_to == address(0)) {
            return 0;
        }
        else if (_value <= 0) {
            return 0;
        }

        bool success = _to.call.value(_value)(bytes4(sha3("ping(uint256)")),_value);
        if (!success) {
            return 0;
        }

        return 1;
    }
}