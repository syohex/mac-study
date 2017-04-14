#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socketvar.h>
#include <netinet/in.h>
#include <netinet/in_pcb.h>
#include <netinet/tcp_var.h>
#include <arpa/inet.h>

int main(void) {
	size_t buf_len;
	int ret = sysctlbyname("net.inet.tcp.pcblist", NULL, &buf_len, NULL, 0);
	if (ret == -1) {
		perror("sysctlbyname");
		return 1;
	}

	char *buf = malloc(buf_len);
	if (buf == NULL) {
		perror("malloc");
		return 1;
	}

	ret = sysctlbyname("net.inet.tcp.pcblist", buf, &buf_len, NULL, 0);
	if (ret == -1) {
		free(buf);
		perror("sysctlbyname");
		return 1;
	}

	struct xinpgen *head = (struct xinpgen*)buf;
	struct xinpgen *current = head;
	while (1) {
		current = (struct xinpgen*)((char*)current + current->xig_len);
		if (current->xig_len <= sizeof(struct xinpgen)) {
			break;
		}

		struct xtcpcb *tcp_current = (struct xtcpcb*)current;

		struct xsocket *so = &(tcp_current->xt_socket);
		if (so->xso_protocol != IPPROTO_TCP)
			continue;

		struct inpcb *inp = &(tcp_current->xt_inp);

		// Ignore PCBs which were freed during copyout
		if (inp->inp_gencnt > head->xig_gen)
			continue;

		if ((inp->inp_vflag & INP_IPV4) != 0) {
			char local_host[INET_ADDRSTRLEN];
			char remote_host[INET_ADDRSTRLEN];
			inet_ntop(AF_INET, &inp->inp_laddr, local_host, INET_ADDRSTRLEN);
			inet_ntop(AF_INET, &inp->inp_faddr, remote_host, INET_ADDRSTRLEN);

			uint16_t local_port = ntohs(inp->inp_lport);
			uint16_t remote_port = ntohs(inp->inp_fport);

			printf("[TCPV4]: local_addr=%s, local_port=%d, remote_addr=%s, remote_port=%d\n",
			       local_host, local_port, remote_host, remote_port);

		} else if ((inp->inp_vflag & INP_IPV6) != 0) {
			char local_host[INET6_ADDRSTRLEN];
			char remote_host[INET6_ADDRSTRLEN];
			inet_ntop(AF_INET6, &inp->in6p_laddr, local_host, INET6_ADDRSTRLEN);
			inet_ntop(AF_INET6, &inp->in6p_faddr, remote_host, INET6_ADDRSTRLEN);

			uint16_t local_port = ntohs(inp->inp_lport);
			uint16_t remote_port = ntohs(inp->inp_fport);

			printf("[TCPV6]: local_addr=%s, local_port=%d, remote_addr=%s, remote_port=%d\n",
			       local_host, local_port, remote_host, remote_port);
		} else {
			continue;
		}
	}

	free(buf);
	return 0;
}
