"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
//import React, { useState, useEffect } from 'react';
require("./App.css");
//import Axios from "axios";
const NavBar_1 = __importDefault(require("./components/NavBar"));
function App() {
    return (react_1.default.createElement(react_1.default.Fragment, null,
        react_1.default.createElement(NavBar_1.default, null)));
}
exports.default = App;
//# sourceMappingURL=App.js.map