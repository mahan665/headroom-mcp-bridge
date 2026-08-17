COPY package.json ./
RUN npm install

# pre-install headroom at BUILD time so startup is instant
ENV UV_TOOL_DIR=/opt/uvtools UV_CACHE_DIR=/opt/uvcache
RUN uv tool install --from 'headroom-ai[mcp]' headroom
ENV PATH="/opt/uvtools/bin:$PATH"

COPY . .
CMD ["npm", "start"]
