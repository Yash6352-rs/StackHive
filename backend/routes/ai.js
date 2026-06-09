import express from "express";
import OpenAI from "openai";

const router = express.Router();

router.post("/generate-answer", async (req, res) => {
  try {

    const { questionId, title, description } = req.body;

    const client = new OpenAI({
      baseURL: "https://openrouter.ai/api/v1",
      apiKey: process.env.OPENROUTER_API_KEY,
    });

    const completion = await client.chat.completions.create({
      model: "openai/gpt-3.5-turbo",

      messages: [
        {
          role: "user",
          content: `
            Answer this StackHive question.

            Title:
            ${title}

            Description:
            ${description}

            Rules:
            - Maximum 3 sentences.
            - Keep answer concise.
            - Be practical.
            - Do not use markdown.
            - Return only the answer.
          `,
        },
      ],
    });

    const answer =
      completion.choices[0].message.content?.trim() ??
      "Unable to generate answer.";

    res.json({
      answer,
    });
    
  } catch (error) {
    console.log(error);

    res.status(500).json({
      error: "Failed to generate answer",
    });
  }
});

export default router;
