import { Actor, HttpAgent } from '@dfinity/agent';
import { idlFactory as bariza_idl, canisterId as bariza_id } from 'dfx-generated/bariza';

const agent = new HttpAgent();
const bariza = Actor.createActor(bariza_idl, { agent, canisterId: bariza_id });

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  const greeting = await bariza.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
