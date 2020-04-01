package com.kh.portfolio.websocket.handler;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class MemoryMonitorHandler extends TextWebSocketHandler implements InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(MemoryMonitorHandler.class);

	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	public MemoryMonitorHandler (){
		super();
		logger.info("create SocketHandler instance!");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		sessionSet.remove(session);
		logger.info("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);

		sessionSet.add(session);
		logger.info("add session!");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		logger.info("receive message:"+message.toString());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
//		logger.error("web socket error!", exception);
		logger.error("web socket error!");
	}

	@Override
	public boolean supportsPartialMessages() {
		logger.info("call method!");

		return super.supportsPartialMessages();
	}

	public void sendMessage (String message){
		for (WebSocketSession session: this.sessionSet){
			if (session.isOpen()){
				try{
					session.sendMessage(new TextMessage(message));
				}catch (Exception ignored){
					logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Thread thread = new Thread(){
			@Override
			public void run() {
				MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();

				while (true){
					try {
						long time = System.currentTimeMillis()+32400000;
						int committed = (int)(memoryBean.getHeapMemoryUsage().getCommitted()/(1024 * 1024));
						int max = (int)(memoryBean.getHeapMemoryUsage().getMax()/(1024 * 1024));
						int used = (int)(memoryBean.getHeapMemoryUsage().getUsed()/(1024 * 1024));

						sendMessage ("[{\"time\":" + time + ", \"used\":" + used + "}," 
									+"{\"time\":" + time + ", \"max\":" + max + "},"
									+"{\"time\":" + time + ", \"committed\":" + committed + "}]");
						
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		thread.start();
	}
}

