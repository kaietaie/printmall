import Router from "express";
import addToNewsList from "../newsletters/addToNewsList.js";
import deleteNewsList from "../newsletters/deleteNewsList.js";
import getEmails from "../newsletters/getEmails.js";

export const newslistRouter = Router();

newslistRouter.get('/getemails', getEmails)
newslistRouter.post('/addemail', addToNewsList)
newslistRouter.delete('/delete', deleteNewsList)