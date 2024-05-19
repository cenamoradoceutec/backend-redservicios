//const express = require('express');
import express from 'express';
const point = express();
import { getPoints, postPoint, getListPoints} from '../controllers/controllerPointServices.js'; 

// Seleccionar informacion o darle informacion al cliente
point.get('/', getPoints);
point.get('/list', getListPoints);
point.post('/', postPoint);

export {
    point
}