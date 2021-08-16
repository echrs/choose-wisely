<template>
  <v-container fill-height fluid>
    <v-row align="center" justify="center" class="text-center"
      ><h1 class="titl white--text font-weight-black">Choose Wisely.</h1></v-row
    >
    <v-row align="center" justify="center" class="text-center"
      ><h2 class="white--text">
        Odaberi projekt koji ti se najviše sviđa i možda ćeš upravo njega
        vidjeti u svom gradu. Projekt s najviše glasova pobjeđuje.
      </h2></v-row
    >
    <v-row align="center" justify="center" class="text-center">
      <v-col> </v-col
      ><v-col>
        <v-card class="mx-auto" outlined max-width="344">
          <v-img src="@/assets/trash.png" height="200px"></v-img>

          <v-card-title class="font-weight-black text-uppercase">
            {{ this.proj1.name }}</v-card-title
          >

          <v-card-subtitle>{{ this.proj1.description }}</v-card-subtitle>

          <v-card-actions>
            <v-btn color="#F05D23" text>Saznaj više</v-btn>

            <v-spacer></v-spacer>

            <v-btn icon @click="show = !show">
              <v-icon>{{
                show ? "mdi-chevron-up" : "mdi-chevron-down"
              }}</v-icon>
            </v-btn>
          </v-card-actions>

          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>
              <v-card-text> Ekstra informacije. </v-card-text>
              <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
            </div>
          </v-expand-transition>
        </v-card>
      </v-col>
      <v-col>
        <v-card class="mx-auto" outlined max-width="344">
          <v-img src="@/assets/cowork.png" height="200px"></v-img>

          <v-card-title class="font-weight-black text-uppercase">{{
            this.proj2.name
          }}</v-card-title>

          <v-card-subtitle>{{ this.proj2.description }}</v-card-subtitle>

          <v-card-actions>
            <v-btn color="#F05D23" text>Saznaj više</v-btn>

            <v-spacer></v-spacer>

            <v-btn icon @click="show = !show">
              <v-icon>{{
                show ? "mdi-chevron-up" : "mdi-chevron-down"
              }}</v-icon>
            </v-btn>
          </v-card-actions>

          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>
              <v-card-text> Ekstra informacije. </v-card-text>
              <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
            </div>
          </v-expand-transition>
        </v-card>
      </v-col>
      <v-col>
        <v-card class="mx-auto" outlined max-width="344">
          <v-img src="@/assets/light.png" height="200px"></v-img>

          <v-card-title class="font-weight-black text-uppercase">{{
            this.proj3.name
          }}</v-card-title>

          <v-card-subtitle>{{ this.proj3.description }}</v-card-subtitle>

          <v-card-actions>
            <v-btn color="#F05D23" text>Saznaj više</v-btn>

            <v-spacer></v-spacer>

            <v-btn icon @click="show = !show">
              <v-icon>{{
                show ? "mdi-chevron-up" : "mdi-chevron-down"
              }}</v-icon>
            </v-btn>
          </v-card-actions>

          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>
              <v-card-text> dd </v-card-text>
              <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
            </div>
          </v-expand-transition>
        </v-card></v-col
      >
      <v-col> </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Web3 from "web3";
const Projects = require("../../build/contracts/Projects.json");

export default {
  name: "Projects",
  mounted() {},
  data: () => ({
    show: false,
    proj1: {},
    proj2: {},
    proj3: {},
  }),
  methods: {
    async initialize() {
      const web3 = new Web3(window.ethereum);
      //get contract creator
      let contractAcc = await web3.eth.getAccounts(console.log);
      console.log("contract created by: " + contractAcc[0]);
      //get acc on metamask
      const metaMaskAcc = await ethereum.request({
        method: "eth_requestAccounts",
      });
      console.log("current acc on metamask: " + metaMaskAcc[0]);
      const netId = await web3.eth.net.getId();
      const deployedNetwork = Projects.networks[netId];
      //get our contract
      const projectsContract = new web3.eth.Contract(
        Projects.abi,
        deployedNetwork.address
      );
      //call contract's methods
      let projectsCount = await projectsContract.methods.projectsCount().call();
      this.proj1 = await projectsContract.methods.projects(1).call();
      this.proj2 = await projectsContract.methods.projects(2).call();
      this.proj3 = await projectsContract.methods.projects(3).call();

      // let vote = await projectsContract.methods.vote(1).send({from: metaMaskAcc[0]})
      // console.log(vote)
    },
  },
  created: function () {
    this.initialize();
  },
};
</script>

<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Bungee&display=swap");
.titl {
  font-family: "Bungee", cursive;
  font-size: 67px;
}
</style>
