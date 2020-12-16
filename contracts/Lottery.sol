// SPDX-License-Identifier: GPL3.0
pragma solidity ^0.7.0;

contract Lottery {
    address payable public manager;
    address payable[] public players;
    uint256 public round;
    address payable public winner;

    constructor(){
        manager = msg.sender;
    }

    //1.买彩票，每次只能投1ETH
    function play() public payable {
        require(msg.value == 0.1 ether);
        //2.把参与者加入彩民池
        players.push(msg.sender);
    }

    modifier onlyManager{
        require(msg.sender == manager);
        _;
    }

    function getPlayersCount() public view returns (uint256){
        return players.length;
    }

    function draw() public onlyManager {
        //根据区块时间、区块难度、彩民总数生成随机数
        bytes memory v1 = abi.encodePacked(block.timestamp, block.difficulty, players.length);
        bytes32 v2 = keccak256(v1);
        uint256 v3 = uint256(v2);
        uint256 index = v3 % players.length;
        //记录这一期中奖者
        winner = players[index];
        //转账
        uint256 money = address(this).balance * 90 / 100;
        uint256 money2 = address(this).balance - money;
        winner.transfer(money);
        manager.transfer(money2);
        //开奖结束，期数加一，清空彩民池
        round++;
        delete players;
    }

    function refund() public onlyManager {
        for (uint256 i = 0; i < players.length; i++) {
            players[i].transfer(1 ether);
        }
        round++;
        delete players;
    }
    
    function getPlayers() public view returns(address payable[] memory){
        return players;
    }

    function getBalance() public view returns (uint256){
        return address(this).balance;
    }

}