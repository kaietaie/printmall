import Router from "express";
import createBlog from "../blog/createBlog.js";
import getBlog from "../blog/getBlog.js";

export const blogRouter = Router();

blogRouter.post('/create', createBlog)
blogRouter.get('/', getBlog)