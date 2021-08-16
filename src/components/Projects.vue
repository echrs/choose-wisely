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
          <v-img
            src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
            height="200px"
          ></v-img>

          <v-card-title class="font-weight-black"
            >NEKI KUL PROJEKT</v-card-title
          >

          <v-card-subtitle>Gradnja ovoga i onoga.</v-card-subtitle>

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
          <v-img
            src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
            height="200px"
          ></v-img>

          <v-card-title class="font-weight-black"
            >NEKI KUL PROJEKT</v-card-title
          >

          <v-card-subtitle>Gradnja ovoga i onoga.</v-card-subtitle>

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
          <v-img
            src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
            height="200px"
          ></v-img>

          <v-card-title class="font-weight-black"
            >NEKI KUL PROJEKT</v-card-title
          >

          <v-card-subtitle>Gradnja ovoga i onoga.</v-card-subtitle>

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
  }),
  methods: {
    async initialize() {
      web3 = new Web3("ws://localhost:8545");
      //ganache accs
      web3.eth.getAccounts(console.log);
      //get our acc, connect to metamask
      const accounts = await ethereum.request({
        method: "eth_requestAccounts",
      });
      //console.log(accounts[0]);
      const netId = await web3.eth.net.getId();
      const deployedNetwork = Projects.networks[netId];
      //get our contract
      const projectsContract = new web3.eth.Contract(
        Projects.abi,
        deployedNetwork.address
      );
      //call contract's methods
      let projectsCount = await projectsContract.methods.projectsCount().call();
      let proj1 = await projectsContract.methods.projects(1).call();
      let proj2 = await projectsContract.methods.projects(2).call();
      let proj3 = await projectsContract.methods.projects(3).call();
      console.log(projectsCount);
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
