IMAGE_NAME_WIN64 = rust-qt-qml-demo-x86_64-w64-mingw32
HOST_OUT = $(CURDIR)/bin

.PHONY: win64 build-win64 copy-win64 clean-win64
win64: build-win64 copy-win64

build-win64:
	docker build \
	    -f Dockerfile-win64 \
		--build-arg JOBS=$$(nproc) \
		-t $(IMAGE_NAME_WIN64) .

copy-win64:
	@mkdir -p $(HOST_OUT)
	container_id=$$(docker create $(IMAGE_NAME_WIN64)); \
	docker cp $$container_id:/rust_qt_qml_demo.exe $(HOST_OUT)/rust_qt_qml_demo.exe; \
	docker rm $$container_id

clean-win64:
	docker rmi $(IMAGE_NAME_WIN64) || true
	rm -rf $(HOST_OUT)
