from typing import Optional
from fastapi import FastAPI
from fastapi.params import Body
from pydantic import BaseModel





app = FastAPI()

class Post(BaseModel):
    title: str
    content: str
    category: str = "Unknown"
    published: bool = True
    rating: Optional[float] = None



@app.get("/")
def root():
    return {"meassage" : "Hello berry, welcome to my api"}


@app.get("/posts")
def posts():
    return {"data" : "Welcome, this is my first post"}


@app.post("/posts")
def create_post(post: Post):
    print (post)
    print (post.dict())
    post_dict = Post.dict()
    post_dict["id"] = range(0, 100000)
    post.append(post_dict)
    return {"data" : post_dict}