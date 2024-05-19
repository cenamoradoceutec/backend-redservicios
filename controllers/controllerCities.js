import { db } from "../db/conexion.js";

const getCities = async (req, res) => {

    const sql = `select * from tbl_cities`;
    const result = await db.query(sql);

    return res.json(result);

}

const getCitiesById = async (req, res) => {

    const { stateId } = req.params;
    const data = [ stateId ];

    const sql = `select * from tbl_cities where id_state $1`;

    const result = await db.query(sql,data);

    return res.json(result);

}

const postCity = async (req, res) => {

    const { name, id_state} = req.body;

    const data = [name, id_state]

    const sql = ` insert into tbl_cities 
                 (name, id_state)
                 values 
                 ($1, $2) returning  *`;

    const result = await db.query(sql, data)

    return res.json({ mensaje: "Insercion Exitosa", obj_creado: result })
}


export {
    getCities,
    getCitiesById,
    postCity   
}