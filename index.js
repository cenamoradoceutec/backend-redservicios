//const express = require('express');
import express from 'express';
const app = express();

import { state } from "./routes/routeStates.js";
import { city } from './routes/routeCities.js';
import { point } from './routes/routeServicesPoint.js';
import { typepoint } from './routes/routeTypePoints.js';

import cors from 'cors';

app.use(express.json());

app.use( cors() );

app.use('/states',state)
app.use('/cities',city)
app.use('/services-point',point)
app.use('/type-points', typepoint)

app.listen(3000, () => {
    console.log("Escuchando en el puerto 3000")
});