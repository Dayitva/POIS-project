pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Bob {
    uint z = 0;

    function getz() public {
        console.log("z = %d", z);
    }

    function pong(uint y) public {
        getz();
        z = 1;
        console.log("In Bob pong before condition check!");
        getz();
        require(y > 100);
        console.log("In Bob pong after condition check!");
        z = 2;
        getz();
    }
}

contract Alice {
    uint y = 0;

    function gety() public {
        console.log("y = %d", y);
    }

    function ping(address addr) public {
        Bob b = Bob(addr);
        gety();
        y = 1;
        console.log("Inside Alice ping before call to Bob pong()!"); 
        gety();
        b.pong(y);  
        console.log("Inside Alice ping after call to Bob pong()!"); 
        y = 2;
        gety();
    }
}

contract VulnerableContract {
    uint x = 0;

    function getx() public {
        console.log("x = %d", x);
    }

    function execute(Alice a, address addr) public {
        getx();
        x = 1;
        console.log("Inside execute before call to Alice ping()!");
        getx();
        (bool success, bytes memory data) = address(a).call(abi.encodeWithSignature("ping(address)", addr));
        console.log("Inside execute after call to Alice ping()!");
        x = 2;
        getx();
    }
}