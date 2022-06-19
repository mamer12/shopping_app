// Imports
const express = require("express");
const authRouter = require("./routes/auth.js");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin.js");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
// INIT
const app = express();
const PORT = process.env.PORT || 3000;
const DB =
  "mongodb+srv://ma_mer12:Mustfaamer12@cluster0.hy5zp.mongodb.net/?retryWrites=true&w=majority";
// Middledware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(userRouter);
app.use(productRouter);
// Connections to DB
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected !!!");
  })
  .catch((e) => {
    console.log(e);
  });
//
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected to PORT ${PORT}`);
});
