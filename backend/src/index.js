import { Router } from "express";
//import express, {Router} from 'express';
const express = requere('express')
let server = express();

server.use(express.json());

let router = new express.Router();
router.get("/home",(req, res) => {
    res.send("Testando")
});


server.use(router);
server.listen(3333);