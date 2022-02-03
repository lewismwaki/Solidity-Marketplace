// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Marketplace {
    string public name;
    uint256 public productCount = 0;
    mapping(uint256 => Product) public products;

    struct Product {
        uint256 id;
        string name;
        uint256 price;
        address owner;
        bool purchased;
    }

    event ProductCreated(
        uint256 id,
        string name,
        uint256 price,
        address owner,
        bool purchased
    );

    constructor() {
        name = "Marketplace";
    }

    function createProduct(string memory _name, uint256 _price) public {
        // make sure params are correct

        //incremeent product count
        productCount++;

        // create a new product
        products[productCount] = Product(
            productCount,
            _name,
            _price,
            msg.sender,
            false
        );

        // trigger an event
        emit ProductCreated(
            productCount,
            _name,
            _price,
            msg.sender,
            false
        );
    }
}
