// Imports
const express = require("express");
const authRouter = require("./routes/auth.js");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin.js");
const productRouter = require("./routes/product");
// INIT
const app = express();
const IP = "192.168.1.8";
const PORT = 3000;
const DB =
  "mongodb+srv://ma_mer12:Mustfaamer12@cluster0.hy5zp.mongodb.net/?retryWrites=true&w=majority";
// Middledware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected !!!");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected to PORT ${PORT}`);
});
