import "Faucet.sol";

contract Token is Mortal{
    Faucet faucet;
    constructor(address _faucet){
        faucet = _faucet;
        _faucet.withdraw(1 ether);
    }
}