import { ethers } from "hardhat";

async function main() {
    const FactoryArtAddress = "0x879eE8758BC8230364447f12A0Ef90843F96827B";
    
    const contractArtifact = require('../artifacts/contracts/FactoryArt.sol/FactoryArt.json');
    const FactoryArtABI = contractArtifact.abi;

    const FactoryArt = await ethers.getContractAt(FactoryArtABI, FactoryArtAddress);


    const name = "My Artwork";
    const url = "https://images.joseartgallery.com/100736/what-kind-of-art-is-popular-right-now.jpg";

    const FactoryArtTx = await FactoryArt.createArtwork(name, url);
    await FactoryArtTx.wait();

    console.log("Function called successfully");
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});



