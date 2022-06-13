// Imports
const express = require("express");
const authRouter = require("./routes/auth.js");
const mongoose = require("mongoose");
// INIT
const app = express();
const PORT = 3000;
const DB =
  "mongodb+srv://ma_mer12:Mustfaamer12@cluster0.hy5zp.mongodb.net/?retryWrites=true&w=majority";
// Middledware
app.use(authRouter);
// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected !!!");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connected to PORT ${PORT}`);
});
