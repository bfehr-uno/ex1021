public aspect TraceAspectFehr {
	pointcut methodToTrace(): execution(String *.getName());
	
	before(): methodToTrace() {
		String methodSignature = thisJoinPointStaticPart.getSignature().toString();
		String lineNumber = Integer.toString(thisJoinPointStaticPart.getSourceLocation().getLine());
		System.out.println("[BGN] " + methodSignature + ", " + lineNumber);
	}
	
	after(): methodToTrace() {
		String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] " + fileName);
	}
	
}
