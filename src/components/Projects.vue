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
export default {
  name: "Projects",

  data: () => ({
    show: false,
  }),
};
</script>

<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Bungee&display=swap");
.titl {
  font-family: "Bungee", cursive;
  font-size: 67px;
}
</style>
