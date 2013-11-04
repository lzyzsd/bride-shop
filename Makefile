TIMEOUT = 5000
SLOW = 500
MOCHA_OPTS = --compilers coffee:coffee-script --timeout $(TIMEOUT) --slow $(SLOW)

test:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		--reporter spec \
		$(MOCHA_OPTS) \
		backend/test/service/**/*.test.coffee \
		backend/test/controllers/**/*.test.coffee \

test-file:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		--reporter  spec \
		$(MOCHA_OPTS) \
		${FILE}

test-cov:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		--require blanket -R html-cov > coverage.html \
		$(MOCHA_OPTS) \
		backend/test/service/**/*.test.coffee \
		backend/test/controllers/**/*.test.coffee \


deploy:
	./deploy.sh
start:
	ssh root@192.168.26.22 'export PATH=$PATH:/bin/node-v0.10.15-linux-x64/bin && cd workspace/ChatService && npm install &&  NODE_ENV=test forever start server.js &&  NODE_ENV=test forever start chat_server.js &&  NODE_ENV=test forever start service/ICRMService_fixture.js'

.PHONY: all test clean