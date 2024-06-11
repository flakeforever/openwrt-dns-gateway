include $(TOPDIR)/rules.mk

PKG_NAME:=dns-gateway
PKG_VERSION:=1.2.3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/flakeforever/dns-gateway.git
PKG_SOURCE_VERSION:=4998b44103b8f31a34de4de4c496473d407d28c6
PKG_RELEASE:=1
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=LGPL-2.1

CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DGIT_SUBMODULE=yes \

define Package/dns-gateway
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libstdcpp +openssl-util
  TITLE:=DNS Gateway
  URL:=$(PKG_SOURCE_URL)  
endef

define Package/dns-gateway/description
  DNS Gateway is a lightweight, efficient, and reliable recursive DNS gateway.
endef

define Package/dns-gateway/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-gateway $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dns-gateway))
