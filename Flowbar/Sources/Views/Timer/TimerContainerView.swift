import SwiftUI

/// Timer screen: the home view (current session + timeline) plus an optional
/// todos list as a right-side panel. The panel is toggled by the title bar
/// `sidebar.right` button and is shown by default.
struct TimerContainerView: View {
    @Environment(AppState.self) var appState
    @Environment(TimerService.self) var timerService

    var body: some View {
        HStack(spacing: 0) {
            TimerHomeView()
                .accessibilityIdentifier("timer-home-view")
                .frame(maxWidth: .infinity)

            if timerService.todosVisible {
                Divider()
                TimerTodosView()
                    .accessibilityIdentifier("timer-todos-view")
                    .frame(width: 280)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.2), value: timerService.todosVisible)
    }
}
