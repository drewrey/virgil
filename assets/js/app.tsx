import "../css/app.scss";

import React from "react";
import ReactDOM from "react-dom";
import Virgil from "./Virgil";

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("VirgilApp");
  if (!container) return;
  ReactDOM.render(<Virgil />, container);
});