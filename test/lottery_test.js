const Lottery = artifacts.require("Lottery")

contract("Lottery", accounts => {
    it("You should be the manager", () =>
        Lottery.deployed()
            .then(instance => {
                return instance.manager.call()
            })
            .then(account => {
                assert.equal(accounts[0], account, "You should be the manager")
            })
    );

})