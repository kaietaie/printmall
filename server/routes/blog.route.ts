import Router from "express";
import createBlog from "../blog/createBlog";
import getBlog from "../blog/getBlog";

export const blogRouter = Router();

blogRouter.post('/create', createBlog)
blogRouter.get('/', getBlog)