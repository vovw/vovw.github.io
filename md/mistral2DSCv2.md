# from mistral to DeepSeekCoderv2 lite
a wip documenting my work to go take my inference engine from mistral to DeepSeekCoderv2 which is a SOTA coding model
## Attention Block

"Attention is all you need" memes.

This class has two functions: one initializes the query, key, value (q, k, v) and output projections as linear layers, and also RoPE for positional encoding. The second function implements the attention mechanisms, namely it does the following:

- It projects the q, k, v values. I like to think of the query as what we are looking for, key as what we have, and value as the actual information.
- Applies RoPE.
- Uses the [scaled_dot_product_attention](https://ml-explore.github.io/mlx/build/html/python/_autosummary/mlx.core.fast.scaled_dot_product_attention.html#mlx.core.fast.scaled_dot_product_attention) for fast attention computation.
- Projects the output back to the model dimension (ensures that the output of one layer can be used as input for the next layer).

### [RoPE](https://paperswithcode.com/method/rope)
- Type of positional embedding which encodes absolute positional information with the rotation of a matrix.
- Basically helps the model understand the order of words in a sequence.

## Feed Forward Network
i dont have more to expand lol prolly look it up

## The Transformer Block

- We create instances of attention and feedforward blocks. We also create two [RMSNorm](https://ml-explore.github.io/mlx/build/html/python/nn/_autosummary/mlx.nn.RMSNorm.html#mlx-nn-rmsnorm) layers for normalization.

```python
r, cache = self.attention(self.attention_norm(x), mask, cache)
h = x + r
r = self.feed_forward(self.ffn_norm(h))
out = h + r
return out, cache
```

- The input goes through attention_norm, then attention to make result (r).
- Then we add the result back to the input, which is a residual connection (h).
- Then this goes through feedforward norm and feedforward network to make result (r).
- We add this result back to the h, which is the output (out).

- We normalize to stabilize the network and speed up training. (Play around with different normalization to build up the intuition.)

- The cache is used for effective autoregressive generation. Basically, it stores key and value tensors to avoid recomputing them for each new token.

## The Mistral Class

- Puts everything together, creates the token embedding, a stack of the transformer blocks for the number of layers, final normalization layer, and an output projection.
- Converts input to embeddings.
- Creates a mask if processing multiple tokens.
- Passes the embeddings through each transformer block.
- Applies final normalization and projects to vocabulary size.

