import { NextApiRequest, NextApiResponse } from "next";
import { MongoClient, Db } from "mongodb";
import dotenv from "dotenv";

dotenv.config();
console.log("analyxe vommtisfsdfsdf sdfdfafasfasf ");
const client = new MongoClient(process.env.MONGODB_URI!, {
  //useNewUrlParser: true,
  // useUnifiedTopology: true modification..... addeed another commit another commit   ,
// auto asignee //



});

async function connectToDatabase(): Promise<Db> {
  await client.connect();
  return client.db();
}

async function disconnectFromDatabase(): Promise<void> {
  await client.close();
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    const db = await connectToDatabase();

    if (req.method === "GET") {
      const users = await db.collection("users").find().toArray();
      res.status(200).json(users);
    } else if (req.method === "POST") {
      const { name } = req.body;
      const result = await db.collection("users").insertOne({ name });
      res.status(201);
    } else {
      res.status(405).json({ message: "Method not allowed" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  } finally {
    await disconnectFromDatabase();
  }
}
